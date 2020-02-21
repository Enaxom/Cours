package dup;

import java.io.Serializable;

/** Mise à jour applicative : une action (op, val) sur une case (index). */
public class Update implements Serializable {

    private static final long serialVersionUID = 1L;
    public static final int ADD = 0;
    public static final int MUL = 1;

    public int index; // case à mettre à jour,
    public int op;    // avec quelle opération,
    public int val;   // et quelle valeur.

    public Update(int index, int op, int val) {
        this.index = index;
        this.op = op;
        this.val = val;
    }
}
